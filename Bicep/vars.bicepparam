using 'main.bicep'

param dnsZones = [
  {
    name: 'mypublicwish-1.com'
  }
  {
    name: 'mypublicwish-2.com'
  }
]

param aRecords = [
// dnsZones[0].name = mypublicwish-1.com
  {
  key: 'a1'
  ip: '1.1.1.1'
  name: 'hosta'
  zoneName: dnsZones[0].name
  ttl: 60
  }
  {
  key: 'a2'
  ip: '2.2.2.2'
  name: 'hostb'
  zoneName: dnsZones[0].name
  ttl: 60
  }

  // dnsZones[1].name = mypublicwish-1.com
  {
  key: 'a3'
  ip: '3.3.3.3'
  name: 'hostb2'
  zoneName: dnsZones[1].name
  ttl: 60
  }
]

param cNameRecords = [
// dnsZones[0].name = mypublicwish-1.com
  {
  key: 'c1'
  name: '419k0hzlooiuoj3b0lkjlkjg0w541wjjydf53txx1hjlgdk'
  target: 'dcv1.digitallycertly.com'
  zoneName: dnsZones[0].name
  ttl: 60
  }
  {
  key: 'c2'
  target: 'verify.cuboidspace.com'
  name: '790kyaq7jlulk3g98dqypd16jlkjlkb3bvgb2htmbh9'
  zoneName: dnsZones[0].name
  ttl: 60
  }

  // dnsZones[1].name = mypublicwish-1.com
  {
  key: 'c3'
  target: 'www.google.com'
  name: 'www'
  zoneName: dnsZones[1].name
  ttl: 60
  }
]


param mxRecords  = [
  {
    key: 'mx1'
    recordName: '@'
    zoneName: dnsZones[0].name
    ttl: 60
    values: [
      {
        preference: 113
        exchange: 'mxa.hypnospp.org'
      }
      {
        preference: 140
        exchange: 'mxb.hypnospq.org'
      }
    ]
  }
  {
    key: 'mx2'
    recordName: '@'
    zoneName: dnsZones[1].name
    ttl: 60
    values: [
      {
        preference: 113
        exchange: 'mxa.hypnosnb.org'
      }
      {
        preference: 140
        exchange: 'mxb.hypnosnc.org'
      }
    ]
  }
]


param txtRecords  = [
  {
    key: 'txt1'
    recordName: '@'
    zoneName: dnsZones[0].name
    ttl: 60
    values: [
      {
        txt: 'v=spf1 include:spf.protection.mumstheword.com include:usb._netblocks.mummyast.com include:nw026.com include:nw027.com include:nw028.com include:emailus.spoiledservice.com include:mg-spf.bluehermano.io include:rp.oracleemaildelivery.com ~all'
      }
      {
        txt: 'ts=ms14576730'
      }
      {
        txt: '5L3Y8JpfEGsMFSGlkjjljlkjH1nMrCg=='
      }
      {
        txt: 'atlantis-domain-verification=CzPBnEJXm0qAjlkjkjdgmsg0y1ECIVn1liU/nufieJ7cIIbTDFD706XHTapL1ucLhKqNcf'
      }
      {
        txt: 'ZOOM_verify_dhpEDCnjkljlkjMSDydf3UdDse6zw'
      }
      {
        txt: 'apple-domain-verification=UwAUvcXmOXMWWqUC'
      }
    ]
  }
  {
    key: 'txt2'
    recordName: '@'
    zoneName: dnsZones[1].name
    ttl: 5
    values: [
      {

        txt: 'ts=ms14576730'
      }
      {
        txt: 'ts=ms14576730sample2'
      }
    ]
  }
]


param srvRecords  = [
  {
    key: 'srv1'
    recordName: '_starssip._tcp.umbrellacorp.com'
    zoneName: dnsZones[0].name
    ttl: 60
    values: [
      {
        priority: 100
        weight: 10
        port: 443
        target: 'sipfed.online.umbrellacorp.com'
      }
    ]
  }
  {
    key: 'srv2'
    recordName: '_motleyfool._tcp.umbrellacorp.com'
    zoneName: dnsZones[0].name
    ttl: 60
    values: [
      {
        priority: 100
        weight: 10
        port: 443
        target: 'motelusmodules.online.uccreelsoft.com'
      }
    ]
  }
  {
    key: 'srv3'
    recordName: '__starssip._tls.extenzaLife.com'
    zoneName: dnsZones[1].name
    ttl: 60
    values: [
      {
        priority: 100
        weight: 10
        port: 443
        target: 'sipdir.online.extenzaLife.com'
      }
      {
        priority: 105
        weight: 13
        port: 443
        target: 'sipdir.online.extenzaLife2.com'
      }
      
    ]
  }
]



// key       = "${module.public_zones.all_zone_names[1]}-01"
//       srvrecord = "_starssip._tcp.umbrellacorp.com"
//       priority  = [100]
//       weight    = [1]
//       ports     = [5061]
//       values    = ["sipfed.online.umbrellacorp.com"]
//       zone      = module.public_zones.all_zone_names[1]
//       ttl       = 1800
