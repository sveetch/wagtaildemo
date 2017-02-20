from .base import *

DEBUG = True

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

# BASE_URL required for notification emails
BASE_URL = 'http://localhost:8000'


INSTALLED_APPS = tuple(list(INSTALLED_APPS)+[
    'wagtail.contrib.wagtailstyleguide',
])


try:
    from .local import *
except ImportError:
    pass
