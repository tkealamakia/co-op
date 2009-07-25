package com.atomyk.wardcoop;

class Ward {
    
    String name
    
    static hasMany = [people: Person, posts: Post]
    static constraints = {
        name(blank: false, unique:true)
    }
    
    
}