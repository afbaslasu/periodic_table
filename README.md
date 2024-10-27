# periodic_table
periodic table database project

This project involves creating a PostgreSQL database for storing detailed information about chemical elements from the periodic table and a Bash script (element.sh) to query data. The script allows users to search for elements based on their atomic number, symbol, or name and outputs relevant details in a user-friendly format.
Project Requirements

    Database Fixes and Modifications:
        Renaming Columns: weight to atomic_mass, melting_point to melting_point_celsius, and boiling_point to boiling_point_celsius.
        Constraints and Requirements: NOT NULL and UNIQUE constraints on symbol and name columns.
        Type Identification: Created a types table to categorize elements by type_id and modified the properties table to use this reference.
        Data Integrity: Adjusted atomic_mass to a DECIMAL type, ensuring trailing zeros are removed.
        Data Entries: Added elements with atomic numbers 9 (Fluorine) and 10 (Neon), and removed any erroneous data (e.g., atomic number 1000).

    Script Creation (element.sh):
        Accepts an atomic number, symbol, or name as a command-line argument.
        Queries the periodic_table database and outputs formatted information about the specified element.
        Provides an error message if the element is not found.

    Git Repository:
        The project is version-controlled with git, with a minimum of six commits following proper conventions (fix:, feat:, etc.).
        Includes a periodic_table.sql file to reconstruct the database if needed.

Database Structure

    Tables:
        elements: Stores atomic_number, symbol, and name with UNIQUE constraints.
        properties: Contains atomic_mass, melting_point_celsius, and boiling_point_celsius and references type_id from types.
        types: Stores unique element types (e.g., metal, nonmetal, metalloid).

Usage
Database Setup

To rebuild the database from the dump file:

bash

psql -U postgres < periodic_table.sql

Running the Script

Ensure element.sh is executable:

bash

chmod +x element.sh

Run the script with an element identifier (atomic number, symbol, or name):

bash

./element.sh H
# Output: "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu..."

If an element is not found:

bash

./element.sh Unobtainium
# Output: "I could not find that element in the database."

License

This project is one of my freeCodeCamp open-source project and it's available for educational and learning purposes.
