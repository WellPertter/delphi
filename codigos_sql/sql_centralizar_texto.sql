SELECT RPAD(LPAD(casa, 41 + LENGTH(casa) - POSITION('-' IN casa), 'X'), 81, 'X' ) FROM teste
