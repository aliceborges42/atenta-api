ComplaintType.destroy_all
TypeSpecification.destroy_all
SecurityButton.destroy_all
TermOfUse.destroy_all
PrivacyPolicy.destroy_all


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

PrivacyPolicy.create(content: <<-CONTENT.strip_heredoc
  **POLÍTICA DE PRIVACIDADE DO ATENTA UNB**

  Última atualização: 16/04/2024

  O Atenta UnB está comprometido em proteger a sua privacidade. Esta Política de Privacidade descreve como coletamos, usamos e compartilhamos suas informações pessoais quando você utiliza nosso aplicativo.

  **Informações que Coletamos:**

  Ao usar o Atenta UnB, podemos coletar as seguintes informações pessoais:

  - Nome completo
  - Endereço de e-mail
  - CPF (Cadastro de Pessoas Físicas)

  **Como Usamos Suas Informações:**

  As informações que coletamos são utilizadas para os seguintes propósitos:

  - Criar e gerenciar sua conta no aplicativo.
  - Fornecer suporte ao usuário e responder a consultas.
  - Enviar comunicações relacionadas ao serviço, como atualizações e notificações.
  - Melhorar e personalizar a experiência do usuário.

  **Compartilhamento de Informações:**

  Não compartilhamos suas informações pessoais com terceiros, exceto nas seguintes circunstâncias:

  - Quando necessário para cumprir com a legislação aplicável.
  - Com seu consentimento explícito.
  - Para proteger os direitos, propriedade ou segurança do Atenta UnB, de nossos usuários ou do público.

  **Segurança das Informações:**

  Empregamos medidas de segurança para proteger suas informações contra acesso não autorizado, alteração, divulgação ou destruição.

  **Seus Direitos:**

  Você tem o direito de acessar, corrigir, atualizar ou excluir suas informações pessoais a qualquer momento. Para exercer esses direitos, entre em contato conosco através dos dados fornecidos abaixo.

  **Alterações nesta Política:**

  Esta Política de Privacidade pode ser atualizada periodicamente. Recomendamos que você reveja esta página regularmente para estar ciente de quaisquer alterações. A data de atualização será indicada na parte superior desta página.

  **Contato:**

  Se você tiver dúvidas ou preocupações sobre esta Política de Privacidade, entre em contato conosco pelo e-mail: atentaapp@gmail.com.

  Ao utilizar o Atenta UnB, você concorda com a coleta e uso de suas informações pessoais conforme descrito nesta Política de Privacidade.
CONTENT
)


TermOfUse.create(content: <<-CONTENT.strip_heredoc
    **TERMOS DE USO DO ATENTA UNB**
  
    Ao utilizar o aplicativo Atenta UnB, você concorda com os seguintes termos:
  
    **Elegibilidade:**
  
    Você declara e garante que é uma mulher para poder utilizar o aplicativo Atenta UnB.
  
    **Denúncias Falsas:**
  
    Você concorda em não fazer denúncias falsas ou enganosas por meio do aplicativo Atenta UnB. Denúncias infundadas podem resultar na suspensão ou encerramento da sua conta.
  
    **Propriedade dos Dados:**
  
    Você concorda em fornecer apenas informações que pertençam a você e em não utilizar dados de terceiros sem permissão.
  
    **Responsabilidade do Usuário:**
  
    Você é responsável por todas as atividades realizadas em sua conta e concorda em manter suas informações de login seguras e confidenciais.
  
    **Uso Adequado:**
  
    Você concorda em usar o aplicativo Atenta UnB de acordo com as leis aplicáveis e em respeitar os direitos de privacidade e propriedade intelectual de terceiros.
  
    **Alterações nos Termos de Uso:**
  
    Reservamo-nos o direito de modificar estes Termos de Uso a qualquer momento, mediante aviso prévio. O uso continuado do aplicativo após tais alterações constitui sua concordância com os novos termos.
  
    **Encerramento da Conta:**
  
    Reservamo-nos o direito de encerrar ou suspender sua conta, a nosso critério, por violação destes Termos de Uso ou por qualquer atividade considerada prejudicial ao aplicativo ou aos outros usuários.
  
    Ao utilizar o aplicativo Atenta UnB, você concorda em cumprir estes Termos de Uso. Se você não concorda com estes termos, por favor, não use o aplicativo.
  CONTENT
  )