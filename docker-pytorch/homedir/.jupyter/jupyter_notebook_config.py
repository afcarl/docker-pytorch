import os
from IPython.lib import passwd

c.NotebookApp.ip = '*'
pw = os.environ.get('PASSWORD', 'isaplanet')
print "Password: {}".format(pw)
c.NotebookApp.password = passwd(pw)

#c.NotebookApp.ip = '127.0.0.1'
#c.NotebookApp.password = ""
#c.NotebookApp.password_required = False
#
#c.NotebookApp.open_browser = True

c.NotebookApp.port = int(os.getenv('PORT', 8888))
c.MultiKernelManager.default_kernel_name = 'python2'
