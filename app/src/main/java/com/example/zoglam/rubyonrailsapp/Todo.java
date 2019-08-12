package com.example.zoglam.rubyonrailsapp;

public class Todo {
    public String text;
    public boolean isCompleted;
    public int projectRef;

    public Todo(String t, boolean ic, int pr){
        text = t;
        isCompleted = ic;
        projectRef = pr;
    }
}
