//
//  Tecnica.swift
//  ChallengePuttingAllTogether
//
//  Created by Lidiane Gomes Barbosa on 19/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation

struct Tecnica{
    let titulo:String
    let descricao:String
    let imageName: String?
}


extension Tecnica{
    static func mockItems()-> [Tecnica]{
        var items=[Tecnica]()
        
        items.append(Tecnica(titulo: "Como utilzar o forno?", descricao: "Para acender um forno a gás primeiro deve encontrar a chama piloto, localizada no fundo do eletrodoméstico. Só tem que abrir a porta e olhar no seu interior, onde logo no centro se situa uma peça de metal pequena.\n\nEm seguida, aproxime do buraco do piloto um fósforo ou um isqueiro para acender o forno. Deve aparecer uma chama azul, que indicará que o forno já pode ser utilizado.\n\nDepois, coloque o eletrodoméstico para funcionar com os botões correspondentes e pronto. Já pode começar a cozinhar!\n\nO forno a gás atinge mais rapidamente um nível elevado de calor comparado com o forno elétrico, além de esfriar mais depressa depois. Este sistema em sua classe convencional tem pontos quentes e pontos frios, o que faz com que o alimento não cozinhe de forma equilibrada. Para resolver isso é melhor adquirir um forno a gás de convecção, que dispõe de uma ventoinha interior para repartir o calor de forma uniforme.\n\nA ventoinha do forno é muito útil para melhorar a circulação de ar, tentando assar os alimentos de forma equitativa. Além disso, também pode ser usada para evitar que a receita saia úmida pela combustão do gás. Assim, a ventoinha mantém o alimento crocante e seco.\n\nOs fornos a gás também podem chegar a queimar a parte de baixo dos seus alimentos, porque o calor costuma ser muito elevado na parte inferior deste eletrodoméstico. Portanto, para evitar que isso aconteça, é recomendável utilizá-lo com uma bandeja ou panela para cozinhar de forma isolada.\n\nNeste tipo de fornos, a temperatura costuma ser irregular devido à liberação do gás que varia segundo o momento. Se estiver preocupado por desconhecer a temperatura em que está assando um alimento, o ideal é recorrer a um termômetro de forno, que poderá colocar no centro do mesmo para encontrar o nível de calor do mesmo.\n\nQuanto a onde colocar os seus alimentos para assar ou cozinhar, para usar um calor mais direto recomenda-se colocar a bandeja na parte de baixo; caso contrário, pode situá-la na parte superior. Por outro lado, mesmo no meio também é uma boa opção se preferir um resultado equilibrado." , imageName: "maminha1"))
        
         items.append(Tecnica(titulo: "Dicas e curiosidades", descricao: "Uma peça de maminha pesa, em média, 2kg.\nA maminha tem uma pequena diferença em relação ao miolo da alcatra. Suas fibras são em forma de leque e o corte deve ser feito contra as fibras, em leque mesmo, mas isso compromete, de certa forma, as pontas.\n\nNa Argentina, esse corte é bem mais aproveitado que no Brasil, pois neste tem sido vendido juntamente com o miolo de alcatra e não separado.\n\nUma alternativa para que a maminha seja uma carne mais valorizada, é colocar o corte em bandejas, ou em embalagem a vácuo, agregando valor ao corte, que é ótima opção para um bom churrasco.\n\nSempre que possível asse-a com sua própria gordura para que a carne permaneça suculenta e macia e não perca sua umidade natural e nutrientes.\nPode assar envolta em papel alumínio ou celofane.\n\nPor sua localização atende pelos nomes de ponta de alcatra ou Colita de Cuadril (em espanhol), Aiguillette Baronne (em francês) e Tail of round ou Tri-tip (em inglês)." , imageName: nil))
        
        items.append(Tecnica(titulo: "Caracteristicas nutricionais", descricao: "Água   75%\nProteína   21%\nSais minerais   3%\nGordura   2%\nVitaminas   0,03%\n" , imageName: "forno"))
        
      items.append(Tecnica(titulo: "Dicas e curiosidades", descricao: "Uma peça de maminha pesa, em média, 2kg.\nA maminha tem uma pequena diferença em relação ao miolo da alcatra. Suas fibras são em forma de leque e o corte deve ser feito contra as fibras, em leque mesmo, mas isso compromete, de certa forma, as pontas.\n\nNa Argentina, esse corte é bem mais aproveitado que no Brasil, pois neste tem sido vendido juntamente com o miolo de alcatra e não separado.\n\nUma alternativa para que a maminha seja uma carne mais valorizada, é colocar o corte em bandejas, ou em embalagem a vácuo, agregando valor ao corte, que é ótima opção para um bom churrasco.\n\nSempre que possível asse-a com sua própria gordura para que a carne permaneça suculenta e macia e não perca sua umidade natural e nutrientes.\nPode assar envolta em papel alumínio ou celofane.\n\nPor sua localização atende pelos nomes de ponta de alcatra ou Colita de Cuadril (em espanhol), Aiguillette Baronne (em francês) e Tail of round ou Tri-tip (em inglês)." , imageName: nil))
        
        
        return items
    }
  
    
    
}
