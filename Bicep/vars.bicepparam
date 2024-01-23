using 'main.bicep'
////////////
// DNS Zones
/////////////

param dnsZones = [
  {
    name: 'mypublicwish-1.com'
  }
  {
    name: 'mypublicwish-2.com'
  }
]

//////////////
//  A REcords
/////////////

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

//////////
// CNAMES
//////////

param cNameRecords = [
// dnsZones[0].name = mypublicwish-1.com
  {
  key: 'c1'
  name: '419k0hzlooiuoj3b0lkjlkjg0w541wjjydf53txx1hjlgdk'
  cname: 'dcv1.digitallycertly.com'
  zoneName: dnsZones[0].name
  ttl: 60
  }
  {
  key: 'c2'
  cname: 'verify.cuboidspace.com'
  name: '790kyaq7jlulk3g98dqypd16jlkjlkb3bvgb2htmbh9'
  zoneName: dnsZones[0].name
  ttl: 60
  }

  // dnsZones[1].name = mypublicwish-1.com
  {
  key: 'c3'
  cname: 'www.google.com'
  name: 'www'
  zoneName: dnsZones[1].name
  ttl: 60
  }
]

//////////////
// MX Records
/////////////


param mxRecords  = [
  // dnsZones[0].name = mypublicwish-1.com
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
  // dnsZones[0].name = mypublicwish-1.com
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


//////////////
// txtRecords
//////////////


param txtRecords  = [
  // dnsZones[0].name = mypublicwish-1.com
  {
    key: 'txt1'
    recordName: '@'
    zoneName: dnsZones[0].name
    ttl: 60
    targets: [
      {
      value: ['v=spf1 include:spf.protection.outlook.com include:usb._netblocks.mimecast.com include:nw026.com include:nw027.com include:nw028.com include:emailus.freshservice.com include:mg-spf.greenhouse.io include:rp.oracleemaildelivery.com ~all']
      }
      {
      value: ['uc=ucJupER9Uyg']
      }


  ]
  }
  // dnsZones[0].name = mypublicwish-1.com
  {
    key: 'txt2'
    recordName: '@'
    zoneName: dnsZones[1].name
    ttl: 60
    targets: [
      {
      value: ['elppa-domain-verification=MGNcyKAUTC0rrZ']
      }
      {
      value: ['MOOZ_verify_649uu9bgwXh7NLKibBgouYcfD5ieT']
      }
  ]
  }

]

////////////////
// SRV Records
////////////////


param srvRecords  = [
  // dnsZones[0].name = mypublicwish-1.com
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
  // dnsZones[0].name = mypublicwish-1.com
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
