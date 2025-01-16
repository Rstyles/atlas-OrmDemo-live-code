#!/bin/bash
mysql.server start
mysql -uroot < ./setup.sql