from flask import Blueprint, request, render_template, session, redirect
from flask_mysqldb import MySQL
import MySQLdb.cursors
from app import mysql

airplane_staff_blueprints = Blueprint('airplane_staff_blueprints', __name__)


@airplane_staff_blueprints.route('/airplanestaffhome')
def airplanestaffhome():
    # We need to fetch Registered Airplanes so Staff can select a value against that
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM flights')
    # fetching data from MySQL
    flights = cursor.fetchall()
    mysql.connection.commit()

    # We need to fetch Registered Airplanes so Staff can select a value against that
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM airplane')
    # fetching data from MySQL
    airplanes = cursor.fetchall()
    mysql.connection.commit()

    # We need to fetch Registered Airports so Staff can select a value against that
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM airport')
    # fetching data from MySQL
    airports = cursor.fetchall()
    mysql.connection.commit()

    # Get All The customer how use maxmium
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT customer_email, COUNT(*) FROM ticket GROUP BY customer_email')
    # fetching data from MySQL
    frequent_user = cursor.fetchall()
    mysql.connection.commit()

    # Get All The Earned Revenue how use maxmium
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT SUM(sold_price) orderTotal FROM ticket')
    # fetching data from MySQL
    viewearner = cursor.fetchall()

    print(viewearner)
    mysql.connection.commit()

    # Get All The Earned Revenue how use maxmium
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT  SUM(sold_price) orderTotal FROM ticket GROUP BY travel_class')
    # fetching data from MySQL
    viewearnerbyclass = cursor.fetchall()
    print(viewearnerbyclass)
    mysql.connection.commit()

    # Get All The customer how use maxmium
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT flight_number, COUNT(*) FROM ticket GROUP BY flight_number')
    # fetching data from MySQL
    topdestination = cursor.fetchall()
    mysql.connection.commit()

    return render_template('airplanestaffhome.html', airplane=airplanes, airport=airports, flight=flights,
                           frequent_user=frequent_user, viewearner=viewearner, viewearnerbyclass=viewearnerbyclass,
                           topdestination=topdestination
                           )


@airplane_staff_blueprints.route('/addflight', methods=['POST', 'GET'])
def addflight():
    if request.method == 'POST':
        arrival_airport = request.form.get('arrival_airport')
        departure_airport = request.form.get('departure_airport')
        flight_number = request.form.get('flight_number')
        status = request.form.get('status')
        departure_date = request.form.get('departure_date')
        arrival_date = request.form.get('arrival_date')
        base_price = request.form.get('base_price')
        airplane_id = request.form.get('airplane_id')
        # first add data to Flighs table
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('INSERT INTO flights VALUES (%s, %s, %s, %s, %s, %s, %s, %s)',
                       (arrival_airport, departure_airport, flight_number, status, departure_date,
                        arrival_date, base_price, airplane_id))
        # fetching data from MySQL
        mysql.connection.commit()

    return redirect('/airplanestaffhome')


@airplane_staff_blueprints.route('/addairline', methods=['POST', 'GET'])
def addairline():
    if request.method == 'POST':
        name = request.form.get('airlinename')
        airplane = request.form.get('airplanename')
        try:
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('INSERT INTO airline VALUES (%s, %s)',
                           (name, airplane))
            # fetching data from MySQL
            mysql.connection.commit()
        except:
            print('No Record Added')

    return redirect('/airplanestaffhome')


@airplane_staff_blueprints.route('/addairplane', methods=['POST', 'GET'])
def addairplane():
    if request.method == 'POST':
        id_no = request.form.get('id_no')
        airline = request.form.get('airline')
        age = request.form.get('age')
        manufacturing = request.form.get('manufacturing')
        try:
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('INSERT INTO airplane VALUES (%s, %s, %s, %s)',
                           (id_no, airline, age, manufacturing))
            # fetching data from MySQL
            mysql.connection.commit()
        except:
            print('Record Not entered')
    return redirect('/airplanestaffhome')


@airplane_staff_blueprints.route('/addairport', methods=['POST', 'GET'])
def addairport():
    if request.method == 'POST':
        name = request.form.get('name')
        city = request.form.get('city')
        country = request.form.get('country')
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('INSERT INTO airport VALUES (%s, %s, %s)',
                       (name, city, country))
        # fetching data from MySQL
        mysql.connection.commit()
    return redirect('/airplanestaffhome')
