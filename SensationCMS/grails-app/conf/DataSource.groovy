dataSource {
	logSql = true
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
			 driverClassName = "com.mysql.jdbc.Driver"
			 url = "jdbc:mysql://localhost:3306/sensationdev"
			 username="root"
			 password="password"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
		dataSource { 			
			dbCreate = "update"
			jndiName = "java:comp/env/myDatasourceName"		
			
		}
	}
}
