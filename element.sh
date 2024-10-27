#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

ARGUMENT=$1
if [[ $ARGUMENT =~ ^[0-9]+$ ]]
then
  QUERY="SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type
         FROM elements 
         INNER JOIN properties USING(atomic_number)
         INNER JOIN types ON properties.type_id = types.type_id
         WHERE atomic_number=$ARGUMENT"
else
  QUERY="SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, type
         FROM elements 
         INNER JOIN properties USING(atomic_number)
         INNER JOIN types ON properties.type_id = types.type_id
         WHERE symbol='$ARGUMENT' OR name='$ARGUMENT'"
fi

ELEMENT=$($PSQL "$QUERY")
if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
else
  echo "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
fi

