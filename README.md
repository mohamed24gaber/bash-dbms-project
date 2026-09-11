# Bash Database Management System (DBMS)

A simple Database Management System built using **Bash Scripting on Linux**.

This project simulates basic database and table management using the Linux file system and command-line tools.

## Features

* Create and delete databases
* Create and delete tables
* Connect to a database
* Insert records
* Select and display records
* Delete records
* Primary key validation
* Input validation using Regular Expressions (Regex)
* Error handling for invalid databases, tables, and IDs

## Technologies

* Linux
* Bash Scripting
* Regular Expressions (Regex)
* `grep`
* `sed`
* `awk`
* Linux File System

## Project Structure

```text
bash-dbms-project/
├── Databases/
│   └── Cairo/
│       └── Students
└── db.sh
```

## How to Run

Clone the repository:

```bash
git clone https://github.com/mohamed24gaber/bash-dbms-project.git
```

Navigate to the project:

```bash
cd bash-dbms-project
```

Make the script executable:

```bash
chmod +x db.sh
```

Run the application:

```bash
./db.sh
```

## Database Operations

The main menu provides:

1. Create Database
2. Delete Database
3. Create Table
4. Delete Table
5. Connect Database
6. Exit

After connecting to a database, users can:

1. Insert Row
2. Select Data
3. Delete Row
4. Exit

## Validation

The project uses Bash Regular Expressions to validate database and table names.

Example:

```bash
[[ $1 =~ ^[A-Za-z] ]]
```

This ensures that the database or table name starts with an English letter.

The project also uses `grep` to check for existing IDs and `sed` to delete records.

## Learning Objectives

This project was developed to strengthen practical skills in:

* Bash scripting
* Linux command-line tools
* Functions and loops
* Conditional statements
* File and directory management
* Regular Expressions
* Text processing
* Git and GitHub

## Author

**Mohamed Gaber Ahmed**

Cloud & DevOps Engineering Learner

GitHub: https://github.com/mohamed24gaber
