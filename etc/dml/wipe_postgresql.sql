DO
$func$
BEGIN
   EXECUTE (
      SELECT 'TRUNCATE TABLE '
             || string_agg(quote_ident(t.tablename), ', ')
             || ' CASCADE'
      FROM   pg_tables t
      WHERE  t.schemaname = 'public'
      AND t.tableowner = current_user
   );
END
$func$;