from flask import Blueprint, request, render_template, session, redirect
from flask_mysqldb import MySQL
import MySQLdb.cursors
from app import mysql

public_blueprint = Blueprint('public_blueprint', __name__)


@public_blueprint.route('/', methods=['POST', 'GET'])
def public():
    if request.method == 'POST':
        source = request.form.get('source')
        destination = request.form.get('destination')

        try:
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM flights  WHERE arrival_airport = %s AND departure_airport = %s',
                           (source, destination,))
            # fetching data from MySQL
            result = cursor.fetchall()
            mysql.connection.commit()
        except:
            result = 'Not Found'

        return render_template('public.html', search_result=result)

    return render_template('public.html', search_result='', search_flight='')


@public_blueprint.route('/searchflight', methods=['POST', 'GET'])
def searchflight():
    flight_number = request.form.get('flight_number')
    departure_date = request.form.get('departure_date')
    arrival_date = request.form.get('arrival_date')

    try:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM flights  WHERE departure_date = %s AND arrival_date = %s AND flight_number = %s',
                       (departure_date, arrival_date,flight_number,))
        # fetching data from MySQL
        search_flight = cursor.fetchall()
        mysql.connection.commit()
    except:
        result = 'Not Found'

    return render_template('public.html', search_flight=search_flight)
