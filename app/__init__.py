
from flask import Flask

from flask_mysqldb import MySQL
mysql = MySQL()


def create_app():
    app = Flask(__name__, template_folder='templates')

    from app.users.users_blueprint import users_blueprint
    app.register_blueprint(users_blueprint)

    from app.airplanestaff.airplane_staff_blueprints import airplane_staff_blueprints
    app.register_blueprint(airplane_staff_blueprints)

    from app.customers.customers_blueprints import customer_blueprints
    app.register_blueprint(customer_blueprints)

    from app.public.public_blueprints import public_blueprint
    app.register_blueprint(public_blueprint)

    app.config['SECRET_KEY'] = 'thisisbeboproject'
    # sqlalchemy .db location (for sqlite)

    # code for connection
    app.config['MYSQL_HOST'] = 'localhost'  # hostname
    app.config['MYSQL_USER'] = 'root'  # username
    app.config['MYSQL_PASSWORD'] = ''  # password
    # in my case password is null so i am keeping empty
    app.config['MYSQL_DB'] = 'flightreservation'  # database name
    # sqlalchemy track modifications in sqlalchemy
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
    # enable debugging mode
    app.config["DEBUG"] = True

    mysql.init_app(app)

    return app
