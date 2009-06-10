package com.atomyk.wardcoop

class Image {
    static belongsTo = [post:Post]
    /* used to create a longblob first time
    static mapping = {
        image type:'blob'
    }
    static constraints = {
        image maxSize:10000000
    }
    */
    
    byte[] image
    String type
    
}
