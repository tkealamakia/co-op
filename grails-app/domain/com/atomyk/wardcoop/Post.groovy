package com.atomyk.wardcoop

class Post {
    static belongsTo = [person:Person, category:Category]
    static hasMany = [images: Image]
    static mapping = {
        columns {
            description type:'text'
        }
    }    
    
    String title
    String description
    String price
    String phone
    Date postDate
    
	static constraints = {
		title(blank: false)
		description(blank: false)
		phone(blank: false)
	}

    
    
}
