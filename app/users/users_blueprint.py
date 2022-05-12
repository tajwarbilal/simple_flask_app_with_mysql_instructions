from flask import Blueprint, request, render_template, session, redirect
from flask_mysqldb import MySQL
import MySQLdb.cursors
from app import mysql

users_blueprint = Blueprint('users_blueprint', __name__)


"""
    We will match credential of Airplane staff and re route them to main page
"""


@users_blueprint.route('/airlinesignin', methods=['POST', 'GET'])
def airlinesignin():
    if request.method == 'POST':
        name = request.form.get('name')
        password = request.form.get('password')

        try:
            # Fetch Data from Airline staff database
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM airline_staff WHERE username = %s', (name,))
            # fetching data from MySQL
            result = cursor.fetchone()
            mysql.connection.commit()
            if result['username'] == name and result['password'] == password:
                session['user'] = result['username']
                return redirect('/airplanestaffhome')

        except:
            pass

    return render_template('airlinesignin.html')


"""
    This route will register the data for airpane staff
"""


@users_blueprint.route('/airlinestaff')
@users_blueprint.route('/airlinestaff', methods=['POST', 'GET'])
def airlinestaff():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        first_name = request.form.get('first_name')
        last_name = request.form.get('last_name')
        date_of_birth = request.form.get('date_of_birth')
        phone_number = request.form.get('phone_number')
        airline_name = request.form.get('airline_name')

        # Now here we gonna enter the data into database
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('INSERT INTO airline_staff VALUES (% s, % s, % s, % s, %s, %s, %s)',
                       (username, password, first_name, last_name, date_of_birth, phone_number, airline_name,))
        # fetching data from MySQL
        mysql.connection.commit()
        return redirect('/airlinesignin')

    # We need to fetch Registered Airlines so Staff can select a value against that
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM airline')
    # fetching data from MySQL
    result = cursor.fetchall()
    mysql.connection.commit()
    return render_template('airlinestaff.html', airlinenames=result)


@users_blueprint.route('/customersignin')
@users_blueprint.route('/customersignin', methods=['POST', 'GET'])
def customersignin():
    if request.method == 'POST':
        email = request.form.get('name')
        password = request.form.get('password')


        try:
            # Fetch Data from Airline staff database
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM customer WHERE email = %s', (email,))
            # fetching data from MySQL
            result = cursor.fetchone()
            mysql.connection.commit()
            if result['email'] == email and result['password'] == password:
                session['user'] = result['email']
                return redirect('/customershome')

        except:
            pass
    return render_template('customersignin.html')


@users_blueprint.route('/customer')
@users_blueprint.route('/customer', methods=['POST', 'GET'])
def customer():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        password = request.form.get('password')
        building_number = request.form.get('buildingnumber')
        street = request.form.get('street')
        city = request.form.get('city')
        state = request.form.get('state')
        phonenumber = request.form.get('phonenumber')
        passport_number = request.form.get('passportno')
        expiration = request.form.get('expiration')
        country = request.form.get('country')
        date_of_birth = request.form.get('dateofbirth')
        card_number = request.form.get('cardno')
        print(name, email, password, building_number, street, city, state, phonenumber, passport_number,
              expiration, country, date_of_birth, card_number
              )

        # first add data to address table
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('INSERT INTO address VALUES (%s, %s, %s, %s)',
                       (building_number, street, city, state,))
        # fetching data from MySQL
        mysql.connection.commit()

        # first add data to passport table
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('INSERT INTO passport VALUES (%s, %s, %s, %s)',
                       (passport_number, expiration, country, date_of_birth,))
        # fetching data from MySQL
        mysql.connection.commit()

        address = building_number
        # first add data to customer table
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('INSERT INTO customer VALUES (%s, %s, %s, %s, %s, %s, %s, %s)',
                       (email, password, name, address, phonenumber, passport_number, card_number, None,))
        # fetching data from MySQL
        mysql.connection.commit()
        return redirect('/customersignin')

    return render_template('customer.html')


@users_blueprint.route('/logout')
def logout():
    if 'user' in session:
        session.pop('user')
    return redirect('/')
