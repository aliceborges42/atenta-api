ComplaintType.destroy_all
TypeSpecification.destroy_all
SecurityButton.destroy_all

ComplaintType.create!([{
    classification: "Desordem"
},
{
    classification: "Episódio"
},   
])

p "Created #{ComplaintType.count} Complaint types"


TypeSpecification.create!([{
    specification: "Assédio Sexual"
},
{
    specification: "Assédio Moral"
}, 
{
    specification: "Assédio Verbal"
},  
{
    specification: "Assédio Institucional"
}, 
{
    specification: "Perseguição"
}, 
{
    specification: "Agressão Física"
},
{
    specification: "Agressão Verbal"
}, 
{
    specification: "Estupro"
}, 
{
    specification: "Assalto"
}, 
{
    specification: "Roubo/Furto"
},
{
    specification: "Imóvel abandonado"
},
{
    specification: "Carros abandonados e carcaças"
},
{
    specification: "Terreno com lixo ou entulho "
},
{
    specification: "Via pública com lixo, entulho "
},
{
    specification: "Cheiros desagradáveis"
},
{
    specification: "Muros pichados"
},
{
    specification: "Poste de luz danificado"
},
{
    specification: "Carros abandonados e carcaças"
},
{
    specification: "Terreno com mato alto; sem poda"
},
{
    specification: "Via pública com mato alto; sem poda"
},
{
    specification: "Lixeiras quebradas"
},
{
    specification: "Esgoto a céu aberto"
},
{
    specification: "Infestação de parasitas"
},
{
    specification: "Coleta de lixo irregular"
},
{
    specification: "Lixo queimado irregularmente"
},
{
    specification: "Paradas de ônibus sujas"
},
{
    specification: "Ocupação irregular do solo"
},
{
    specification: "Via mal iluminada"
},
{
    specification: "Vias com problemas para pedestres"
},
{
    specification: "Área de lazer e esporte quebrados"
},
{
    specification: "Transporte público pirata"
},
{
    specification: "Arranjo do transito impróprio"
},
{
    specification: "Rua sem asfalto"
},
{
    specification: "Barulhos de tiros"
},
{
    specification: "Ruídos, música alta e gritaria"
},
{
    specification: "Vendedores ambulantes/camelôs"
},
{
    specification: "Flanelinhas"
},
{
    specification: "População em situação de rua"
},
{
    specification: "Prostituição"
}, 
{
    specification: "Área de apostas em dinheiro"
}, 
{
    specification: "Pedintes"
}, 
{
    specification: "Pessoas fazendo xixi ou coco na rua"
}, 
{
    specification: "Uso de drogas ilegais na rua"
}, 
{
    specification: "Uso de bebidas alcoólicas na rua"
}, 
{
    specification: "Trabalho infantil"
}, 
{
    specification: "Presença de arma de fogo"
}, 
{
    specification: "Tráfico"
}, 
{
    specification: "Lixo queimado irregularmente"
}, 
{
    specification: "Ato obsceno em local público"
},   
])

p "Created #{TypeSpecification.count} Specifications"

SecurityButton.create!([{
    latitude: -15.766067993090232, 
    longitude: -47.86651662435389,
    name: "ICC Sul / IB / BSAS"
},
{
    latitude: -15.763849615041647, 
    longitude: -47.864986444587224,
    name: "Trajeto para a Casa dos Estudantes"
},  
{
    latitude: -15.768013299630317, 
    longitude: -47.86563085214526,
    name: "IQ / FS / BSAS / IB"
},  
{
    latitude: -15.7659623958492, 
    longitude: -47.869815151994615,
    name: "Passagem para o ICC Sul"
}, 
{
    latitude: -15.763038030480098, 
    longitude: -47.87182886809824,
    name:"Passagem para o ICC Norte"
},
{
    latitude: -15.759971936107265, 
    longitude: -47.87063382534788,
    name: "ICC Norte / Pavilhões"
},
{
    latitude: -15.757805514820099, 
    longitude: -47.8708941965447,
    name: "Pavilhões / BSAN"
}, 
{
    latitude: -15.761190618627106, 
    longitude: -47.867440482887176,
    name: "BCE"
}, 
{
    latitude: -15.76476959396042, 
    longitude: -47.858360346009086,
    name: "Casa do Estudante Universitário - CEU"
}, 
{
    latitude: -15.764245740672985, 
    longitude: -47.86992295197963,
    name: "Restaurante Universitário - RU / Centro de Vivência"
}, 
{
    latitude: -15.76705452891724, 
    longitude: -47.87112426168686,
    name: "FE"
},    
])

p "Created #{SecurityButton.count} Security Buttons"