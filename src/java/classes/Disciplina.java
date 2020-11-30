/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import Web.DBListener;
import static Web.DBListener.exception;
import static Web.DBListener.getConnection;
import java.util.ArrayList;
import java.sql.*;
/**
 *
 * @author vm_es
 */
public class Disciplina {
    private int id;
    private String nome;
    private String ementa;
    private int ciclo;
    private float nota;
    
    // contructor
    public Disciplina(int id, String nome, String ementa, int ciclo, float nota) {
        this.id = id;
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
    }
    
    // getters
    public int getId() {
        return this.id;
    }
    public String getNome() {
        return this.nome;
    }
    public String getEmenta() {
        return this.ementa;
    }
    public int getCiclo() {
        return this.ciclo;
    }
    public float getNota() {
        return this.nota;
    }
    
    // setters
    public void setNome(int id, String nome) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("UPDATE disciplinas SET nome = ? WHERE id = ?;");
            stmt.setString(1, nome);
            stmt.setInt(2, id);
            stmt.execute();
            
        } catch(Exception e) {
            exception = e.getLocalizedMessage();
        } finally {
           try { stmt.close(); } catch(Exception ex){} 
           try { conn.close(); } catch(Exception ex1){} 
        }
        
        this.nome = nome;
    }
    public void setEmenta(int id, String ementa) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("UPDATE disciplinas SET ementa = ? WHERE id = ?;");
            stmt.setString(1, ementa);
            stmt.setInt(2, id);
            stmt.execute();
            
        } catch(Exception e) {
            exception = e.getLocalizedMessage();
        } finally {
           try { stmt.close(); } catch(Exception ex){} 
           try { conn.close(); } catch(Exception ex1){} 
        }
        
        this.ementa = ementa;
    }
    public void setCiclo(int id, int ciclo) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("UPDATE disciplinas SET ciclo = ? WHERE id = ?;");
            stmt.setInt(1, ciclo);
            stmt.setInt(2, id);
            stmt.execute();
            
        } catch(Exception e) {
            exception = e.getLocalizedMessage();
        } finally {
           try { stmt.close(); } catch(Exception ex){} 
           try { conn.close(); } catch(Exception ex1){} 
        }
        
        this.ciclo = ciclo;
    }
    public void setNota(int id, float nota) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("UPDATE disciplinas SET nota = ? WHERE id = ?;");
            stmt.setFloat(1, nota);
            stmt.setInt(2, id);
            stmt.execute();
            
        } catch(Exception e) {
            exception = e.getLocalizedMessage();
        } finally {
           try { stmt.close(); } catch(Exception ex){} 
           try { conn.close(); } catch(Exception ex1){} 
        }
        
        this.nota = nota;
    }
    
    public static ArrayList<Disciplina> getList() {
        ArrayList<Disciplina> matriculadas = new ArrayList();
        
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DBListener.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM disciplinas;");
            
            while(rs.next()) {
                matriculadas.add(
                    new Disciplina(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getString("ementa"),
                        rs.getInt("ciclo"),
                        rs.getFloat("nota")
                    )
                );
            }
        } catch(Exception e) {
        } finally {
           try { stmt.close(); } catch(Exception ex){} 
           try { conn.close(); } catch(Exception ex1){} 
        }
        
        return matriculadas;
    }
    
    public static void create(String nome, String ementa, int ciclo) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("INSERT INTO disciplinas (nome, ementa, ciclo) VALUES (?, ?, ?);");
            stmt.setString(1, nome);
            stmt.setString(2, ementa);
            stmt.setInt(3, ciclo);
            stmt.execute();
            
        } catch(Exception e) {
            exception = e.getLocalizedMessage();
        } finally {
           try { stmt.close(); } catch(Exception ex){} 
           try { conn.close(); } catch(Exception ex1){} 
        }
    }
    
    public static void delete(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("DELETE FROM disciplinas WHERE id = ?;");
            stmt.setInt(1, id);
            stmt.execute();
            
        } catch(Exception e) {
            exception = e.getLocalizedMessage();
        } finally {
           try { stmt.close(); } catch(Exception ex){} 
           try { conn.close(); } catch(Exception ex1){} 
        }
    }
    
    public static String getCreateStatement() {
        return "CREATE TABLE IF NOT EXISTS disciplinas ("
                + "id INTEGER PRIMARY KEY,"
                + "nome VARCHAR(255) NOT NULL,"
                + "ementa VARCHAR(255) NOT NULL,"
                + "ciclo INTEGER NOT NULL,"
                + "nota FLOAT"
                + ");";
    }
}
