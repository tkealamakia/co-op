package com.atomyk.wardcoop;

class Ward {
    
    String name
    
    static hasMany = [people: Person]
    static constraints = {
        name(blank: false, unique:true)
    }
    
    
}