#!/bin/bash

export PGPASSWORD=postgres

echo "########################################"
echo "ORIGINAL QUERY"
echo "########################################"
psql region -P pager=off -qt -h 127.0.0.1 -p 5432 -U postgres -f original_query.sql
echo
echo
psql region -P pager=off -qt -h 127.0.0.1 -p 5433 -U postgres -f original_query.sql
echo "########################################"

echo "########################################"
echo "MODIFIED QUERY"
echo "########################################"
psql region -P pager=off -qt -h 127.0.0.1 -p 5432 -U postgres -f modified_query.sql
echo
echo
psql region -P pager=off -qt -h 127.0.0.1 -p 5433 -U postgres -f modified_query.sql
echo "########################################"
