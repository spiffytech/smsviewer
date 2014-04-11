from pyramid.view import view_config


@view_config(route_name='home', renderer='hello.mako')
def my_view(request):
    return {'project': 'smsviewer'}
