from pyramid.view import view_config

from lxml import etree

tree = None

@view_config(route_name='index', renderer='index.mako')
def my_view(request):
    smsfile = "sms.xml"
    global tree
    if tree is None:
        with open(smsfile) as f:
            tree = etree.parse(f)

    root = tree.getroot()
    els = root.xpath("*[@contact_name='Lacey Shankle']")
    smses = root.xpath("//smses/sms[@contact_name='Lacey Shankle']")
    mmses = root.xpath("//smses/mms[@contact_name='Lacey Shankle' and parts/part[@data]]")
    #import pdb; pdb.set_trace()
    print len(smses)
    print len(mmses)
    els = smses + mmses

    return {"messages": sorted(els, key=lambda message: message.get("date"))}
