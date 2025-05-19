
import sqlite3
from datetime import date
#
# def create_users_table():
#     # подключаемся к бд
#     conn = sqlite3.connect("lesson8.db")
#     # для управления бд
#     cursor = conn.cursor()
#     # метод execute нужен для запуска SQL кода
#     cursor.execute(
#         """
#             CREATE TABLE users(
#             id INTEGER PRIMARY KEY AUTOINCREMENT,
#             username VARCHAR(255) NOT NULL
#             )
#         """
#     )
#     # нужен чтобы сохранить изменения
#     conn.commit()
#     conn.close()
#
#
# def add_user(username):
#     conn = sqlite3.connect("lesson8.db")
#     cursor = conn.cursor()
#     cursor.execute(
#         """
#             INSERT INTO users(username)
#             VALUES(?)
#         """, (username, )
#     )
#
#     conn.commit()
#     conn.close()
#
#
# def get_all_users():
#     conn = sqlite3.connect("lesson8.db")
#     cursor = conn.cursor()
#     cursor.execute(
#         """
#             SELECT * FROM users WHERE id=?
#         """, (1, )
#     )
#     # users = cursor.fetchall()
#     user = cursor.fetchone()
#     print(user)
#
#
# # create_users_table()
# # add_user("ruslan")
# # add_user("timur")
# get_all_users()


#################################################################################


def create_table_authors():
    conn = sqlite3.connect("lesson8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            CREATE TABLE authors(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            first_name VARCHAR(255) NOT NULL,
            last_name VARCHAR(255) NOT NULL,
            date_of_birth DATE
            )
        """
    )
    # нужен чтобы сохранить изменения
    conn.commit()
    conn.close()

# create_table_authors()

def create_table_books():
    conn = sqlite3.connect("lesson8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            CREATE TABLE books(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(512) NOT NULL,
            description TEXT,
            rating INTEGER,
            year DATE,
            author_id INTEGER,
            FOREIGN KEY (author_id) REFERENCES authors(id)
            )
        """
    )
    # нужен чтобы сохранить изменения
    conn.commit()
    conn.close()

# create_table_books()

# def drop_table():
#     conn = sqlite3.connect("lesson8.db")
#     cursor = conn.cursor()
#     cursor.execute(
#         """
#             DROP TABLE users
#         """
#     )
#     # нужен чтобы сохранить изменения
#     conn.commit()
#     conn.close()
#
#
# drop_table()


def add_authors(first_name, last_name, date_of_birth):
    conn = sqlite3.connect("lesson8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            INSERT INTO authors(first_name, last_name, date_of_birth)
            VALUES(?, ?, ?)
        """, (first_name, last_name, date_of_birth)
    )

    conn.commit()
    conn.close()

# add_authors("Стивен", "Кинг", "1975-12-03")
# add_authors("Федор", "Достоевский", "1821-05-23")
# add_authors("Нил", "Гейман ", "1960-11-20")
# add_authors("Александр", "Пушкин ", "1799-05-13")
# add_authors("Джон ", "Толкин ", "1955-02-07")

def add_books(name, description, rating, year, author_id):
    conn = sqlite3.connect("lesson8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            INSERT INTO books(name, description, rating, year, author_id)
            VALUES(?, ?, ?, ?, ?)
        """, (name, description, rating, year, author_id)
    )

    conn.commit()
    conn.close()

# add_books("book1", "book1book1book1book1", 6.7, 2022, 1)
# add_books("book2", "book2book2book2book2book2book2", 9.4, 2023, 1)
# add_books("book3", "book3book3book3book3", 9.3, 2025, 1)
# add_books("book4", "book4book4", 7.2, 2023, 2)
# add_books("book5", "book5book5book5", 6.0, 2023, 2)
# add_books("book6", "book6book6book6book6book6", 8.2, 2024, 2)
# add_books("book7", "book7book7book7", 9.3, 2025, 3)
# add_books("book8", "book8book8", 4.5, 2020, 3)
# add_books("book9", "book9book9book9book9book9", 7.2, 2023, 3)
# add_books("book10", "book10book10book10book10", 6.1, 2021, 4)
# add_books("book11", "book11book11book11book11", 5.8, 2025, 4)
# add_books("book12", "book12book12book12book12book12", 5.8, 2023, 4)
# add_books("book13", "book13book13book13", 7.4, 2025, 5)
# add_books("book14", "book14book14", 9.3, 2023, 5)
# add_books("book15", "book15book15book15book15", 6.8, 2021, 5)
# add_books("book16", "book16book16book16", 8.1, 2022, 5)

def get_all_authors():
    conn = sqlite3.connect("lesson8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            SELECT * FROM authors
        """
    )
    authors = cursor.fetchall()
    print(authors)

# get_all_authors()


def get_all_books():
    conn = sqlite3.connect("lesson8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            SELECT * FROM books
        """
    )
    books = cursor.fetchall()
    print(books)


# get_all_books()

############################
def get_authors_by_date():
    conn = sqlite3.connect("lesson8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            SELECT
             first_name,
             last_name,
             date_of_birth
             FROM authors
             WHERE date_of_birth BETWEEN "1900-01-01" AND "2000-01-01"
        """
    )
    authors = cursor.fetchall()
    print(authors)
# get_authors_by_date()


############################
def get_authors_by_name():
    conn = sqlite3.connect("lesson8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            SELECT
             first_name || " " || last_name AS fullname,
             date_of_birth
             FROM authors
             WHERE first_name || " " || last_name  = "Стивен Кинг"
        """
    )
    authors = cursor.fetchall()
    print(authors)

# get_authors_by_name()

############################
def get_books_by_name():
    conn = sqlite3.connect("lesson8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            SELECT
             name,
             rating
             FROM books
             WHERE name  = "book3"
        """
    )
    book = cursor.fetchone()
    print(book)

# get_books_by_name()

############################
def get_books_by_rating():
    conn = sqlite3.connect("lesson8.db")
    cursor = conn.cursor()
    cursor.execute(
        """
            SELECT
             name,
             rating
             FROM books
             WHERE rating BETWEEN 8 AND 10
             ORDER BY rating ASC
        """
    )
    books = cursor.fetchall()
    print(books)

# get_books_by_rating()

