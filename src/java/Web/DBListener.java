/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Web;

import classes.Disciplina;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;

/**
 * Web application lifecycle listener.
 *
 * @author vm_es
 */
public class DBListener implements ServletContextListener {
    private static final String CLASS_NAME = "org.sqlite.JDBC";
    private static final String DB_URL  = "jdbc:sqlite:prova2_poo.db";
    public static String exception = null;
    
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL);
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Connection conn = null;
        Statement stmt = null;
        
        try {
            Class.forName(CLASS_NAME);
            conn = getConnection();
            stmt = conn.createStatement();
            stmt.execute(Disciplina.getCreateStatement());
            
            if(Disciplina.getList() == null || Disciplina.getList().isEmpty()) {
                stmt.execute("INSERT INTO disciplinas (nome, ementa, ciclo) VALUES "
                        + "('Programação Orientada a Objetos', 'Ementa de POO', 4),"
                        + "('Engenharia de Software', 'Ementa de Eng', 4),"
                        + "('Sistemas Operacionais', 'Ementa de SO', 4),"
                        + "('Linguagem de Programação 4', 'Ementa de LP4', 4),"
                        + "('Metodologia', 'Ementa de Metodologia', 4),"
                        + "('Banco de Dados', 'Ementa de BD', 4),"
                        + "('Segurança da Informação', 'Ementa de SI', 5);");
            }
            
        } catch(Exception e) {
            exception = e.getLocalizedMessage();
        } finally {
           try { stmt.close(); } catch(Exception ex){} 
           try { conn.close(); } catch(Exception ex1){} 
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
