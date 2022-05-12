from flask import Blueprint, request, render_template, session, redirect
from flask_mysqldb import MySQL
import MySQLdb.cursors
from app import mysql

customer_blueprints = Blueprint('customer_blueprints', __name__)


@customer_blueprints.route('/customershome')
def customershome():
    # We need to fetch Registered Airplanes so Staff can select a value against that
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM flights')
    # fetching data from MySQL
    fly = cursor.fetchall()
    mysql.connection.commit()

    for i in fly:
        print(i['flight_number'])

    customer_email = session['user']
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM ticket  WHERE customer_email = %s',
                   (customer_email,))
    # fetching data from MySQL
    tickets = cursor.fetchall()
    mysql.connection.commit()

    customer_email = session['user']
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM ticket  WHERE customer_email = %s',
                   (customer_email,))
    # fetching data from MySQL
    reviews = cursor.fetchall()
    mysql.connection.commit()
    user = session['user']

    customer_email = session['user']
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM myspendings  WHERE name = %s',
                   (customer_email,))
    # fetching data from MySQL
    totalspen = cursor.fetchall()
    mysql.connection.commit()

    return render_template('customers_home.html', flight_result=fly, tickets=tickets, reviews=reviews, user=user,
                           total_spendings=totalspen)


@customer_blueprints.route('/customersearchflight', methods=['POST', 'GET'])
def customersearchflight():
    arrival_airport = request.form.get('source')
    departure_airport = request.form.get('destination')

    try:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM flights  WHERE departure_airport = %s AND arrival_airport = %s',
                       (departure_airport, arrival_airport,))
        # fetching data from MySQL
        search_flight = cursor.fetchall()
        mysql.connection.commit()
    except:
        result = 'Not Found'

    return render_template('customers_home.html', search_flight=search_flight)


@customer_blueprints.route('/purchaseticket', methods=['POST', 'GET'])
def purchaseticket():
    buildingnumber = request.form.get('buildingnumber')
    street = request.form.get('street')
    city = request.form.get('city')
    state = request.form.get('state')
    travel_class = request.form.get('travel_class')
    flight_number = request.form.get('flight_number')

    try:
        # first add data to Ticket table
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('INSERT INTO address VALUES (%s, %s, %s, %s)',
                       (buildingnumber, street, city, state,))
        # fetching data from MySQL
        mysql.connection.commit()

        airline_name = 'emirate'

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM flights  WHERE flight_number = %s',
                       (flight_number,))
        # fetching data from MySQL
        sold_price = cursor.fetchone()
        sold_price = sold_price['base_price']
        mysql.connection.commit()

        customer_email = session['user']
        # first add data to address table
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('INSERT INTO ticket VALUES (%s, %s, %s, %s, %s, %s)',
                       (customer_email, buildingnumber, travel_class, airline_name, flight_number, sold_price))
        # fetching data from MySQL
        mysql.connection.commit()

        # Gonna Implement Track My Spending
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('INSERT INTO myspendings  VALUES (%s, %s)',
                       (customer_email, sold_price,))
        # fetching data from MySQL
        mysql.connection.commit()


    except:
        pass

    return redirect('/customershome')


@customer_blueprints.route('/delete')
def delete():
    flight_number = request.args.get('flightnumber')
    user_email = session['user']
    try:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('DELETE FROM ticket WHERE flight_number = %s AND  customer_email = %s',
                       (flight_number, user_email,))
        # fetching data from MySQL
        mysql.connection.commit()
    except:
        pass
    return redirect('/customershome')


@customer_blueprints.route('/remarks', methods=['POST', 'GET'])
def remarks():
    return redirect('/customershome')
