-- Función simple para sumar dos numeros

    CREATE OR REPLACE FUNCTION sumar_numeros(a NUMBER, b NUMBER)
    RETURN NUMBER
    IS
        resultado NUMBER;
    BEGIN
        resultado := a + b;
        RETURN resultado;
    END;
    /


-- Ejecutamos la función sumar_numeros

    SET SERVEROUTPUT ON;
    DECLARE
      total NUMBER;
    BEGIN
      total := sumar_numeros(5, 3);
      DBMS_OUTPUT.PUT_LINE('La suma es: ' || total);
    END;
    /














-- Funcion Simple para obtener un saludo con concatenación

    CREATE OR REPLACE FUNCTION obtener_saludo(nombre IN VARCHAR2) RETURN VARCHAR2 AS
      saludo VARCHAR2(100);
    BEGIN
      saludo := 'Hola, ' || nombre || '! ¿Cómo estás?';
      RETURN saludo;
    END; 
    /


-- Ejecutamos la función obtener_saludo

    SET SERVEROUTPUT ON;
    DECLARE
      resultado VARCHAR2(100);
    BEGIN
      resultado := obtener_saludo('Pedro');
      DBMS_OUTPUT.PUT_LINE(resultado);
    END;
    /
















-- Función para calcular precio total de ventas general
    CREATE OR REPLACE FUNCTION calcular_precio_total_general
    RETURN DECIMAL
    IS
      total DECIMAL(8,2);
    BEGIN
      SELECT 
          SUM(p.precio * vd.cantidad)
          INTO total
      FROM VENTA_DETALLE vd
      INNER JOIN PRODUCTO p ON vd.producto_id = p.id;
      
      RETURN total;
    END;
    /

-- Ejecutamos la función calcular_precio_total_general
    SET SERVEROUTPUT ON;
    DECLARE
      precio_total DECIMAL(8,2);
    BEGIN
      precio_total := calcular_precio_total_general;
      DBMS_OUTPUT.PUT_LINE('El precio total general de todas las ventas es: ' || 'S/' || precio_total);
    END;














-- Función para poder ver el total de reservas por cada producto

  -- La función devuelve un cursor (SYS_REFCURSOR) que se puede usar para recuperar el conjunto de resultados
  CREATE OR REPLACE FUNCTION calcular_total_reservas_producto
  RETURN SYS_REFCURSOR
  IS
      v_cursor SYS_REFCURSOR;
  BEGIN
      OPEN v_cursor FOR
          SELECT p.id AS producto_id, p.nombre AS producto_nombre, COUNT(rd.reserva_id) AS total_reservas
          FROM PRODUCTO p
          LEFT JOIN RESERVA_DETALLE rd ON p.id = rd.producto_id
          GROUP BY p.id, p.nombre
          ORDER BY p.id ASC;
          
          
      RETURN v_cursor;
  END;
  /


-- Ejecutamos la función calcular_total_reservas_producto

  SET SERVEROUTPUT ON;
  DECLARE
      v_result SYS_REFCURSOR;
      v_producto_id PRODUCTO.id%TYPE;
      v_producto_nombre PRODUCTO.nombre%TYPE;
      v_total_reservas NUMBER;
  BEGIN
      v_result := calcular_total_reservas_producto();
      
      LOOP
          FETCH v_result INTO v_producto_id, v_producto_nombre, v_total_reservas;
          EXIT WHEN v_result%NOTFOUND;
          
          -- Impriminos por consola
          DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_producto_id || ', Nombre: ' || v_producto_nombre || ',   Total de reservaciónes: ' || v_total_reservas);
      END LOOP;
      
      CLOSE v_result;
  END;
  /
  
  
  
        -- Un poco mas con formato
        SET SERVEROUTPUT ON;
        DECLARE
            v_result SYS_REFCURSOR;
            v_producto_id PRODUCTO.id%TYPE;
            v_producto_nombre PRODUCTO.nombre%TYPE;
            v_total_reservas NUMBER;
        BEGIN
            v_result := calcular_total_reservas_producto();
        
            -- Imprimir encabezados
            DBMS_OUTPUT.PUT_LINE('Product ID  |  Nombre              | Total de reservaciones');
            DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------');
        
            LOOP
                FETCH v_result INTO v_producto_id, v_producto_nombre, v_total_reservas;
                EXIT WHEN v_result%NOTFOUND;
        
                -- Imprimir valores alineados
                DBMS_OUTPUT.PUT_LINE(
                    RPAD(v_producto_id, 11) || ' | ' ||
                    RPAD(v_producto_nombre, 20) || ' | ' ||
                    LPAD(v_total_reservas, 5)
                );
            END LOOP;
        
            CLOSE v_result;
        END;
        /

