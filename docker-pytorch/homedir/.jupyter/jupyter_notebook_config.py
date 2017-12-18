import os
from IPython.lib import passwd
import random

c.NotebookApp.ip = '*'
if "JUPYTER_PASSWORD" in os.environ:
    pw = os.environ.get('JUPYTER_PASSWORD', pw)
    print "Password: {}".format(pw)
    c.NotebookApp.password = passwd(pw)

#c.NotebookApp.ip = '127.0.0.1'
#c.NotebookApp.password = ""
#c.NotebookApp.password_required = False
#c.NotebookApp.open_browser = True

c.NotebookApp.port = int(os.getenv('PORT', 8888))
c.MultiKernelManager.default_kernel_name = 'python2'
