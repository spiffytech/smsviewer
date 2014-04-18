from pyramid.view import view_config

from lxml import etree

@view_config(route_name='index', renderer='index.mako')
def my_view(request):
    smsfile = "sms.xml"
    with open(smsfile) as f:
        tree = etree.parse(f)

    root = tree.getroot()

    els = root.xpath("*[@contact_name='Lacey Shankle']")

    return {"messages": sorted(els, key=lambda message: message.get("date"))}
