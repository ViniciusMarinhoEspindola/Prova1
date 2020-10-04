/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.ArrayList;

/**
 *
 * @author vm_es
 */
public class Disciplina {
    private String nome;
    private String ementa;
    private int ciclo;
    private float nota;
    private static ArrayList<Disciplina> matriculadas;
    
    // contructor
    public Disciplina(String nome, String ementa, int ciclo) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
    }
    
    // getters
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
    public void setNome(String nome) {
        this.nome = nome;
    }
    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }
    public void setCiclo(int ciclo) {
        this.ciclo = ciclo;
    }
    public void setNota(float nota) {
        this.nota = nota;
    }
    
    public static void setList(ArrayList<Disciplina> disciplinas) {
        matriculadas = disciplinas;
    }
    
    public static ArrayList<Disciplina> getList() {
        return matriculadas;
    }
}
