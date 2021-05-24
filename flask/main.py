from app import app
from app import huey
import tasks  
import views  


if __name__ == '__main__':
    app.run(port=5000, debug=True, host  ='0.0.0.0')
