package com.atomyk.wardcoop

class Category {
    
    String name
    int displayOrder
    
    static hasMany = [posts:Post]
    
    String toString() {
        name
    }
}
