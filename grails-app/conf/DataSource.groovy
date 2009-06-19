dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			//dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			//url = "jdbc:hsqldb:mem:devDB"
			dbCreate = "update"
			url = "jdbc:mysql://localhost/wardcoop"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "root"
			password = "asdfg"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			//dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			//url = "jdbc:hsqldb:mem:devDB"
			dbCreate = "update"
			url = "jdbc:mysql://localhost/wardcoop"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "root"
			password = ""
		}
	}
}