import com.obee.sensation.User
import grails.util.GrailsUtil

class BootStrap {
  def init = { servletContext ->
    switch(GrailsUtil.environment){
      case "development":
        def admin = new User(login:"admin", 
                             password:"password", 
                             name:"Administrator")
        admin.save()
              
      break

      case "production":
      break
    }

  }
  def destroy = {
  }
}
