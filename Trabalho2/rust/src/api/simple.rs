/*
#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet2(nome: String) -> String {
    format!("Hello, {nome}!")
}
*/

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn treinar_rede_perceptron(vetor_matriz_1: Vec<bool>, vetor_matriz_2: Vec<bool>, vetor_teste: Vec<bool>) -> String {
    let mut entradas: [[f32; 100]; 2] = [[-1.0; 100]; 2];
    let mut entrada_teste: [f32; 100] = [0.0; 100];
    
    let limiar: f32 = 0.0;
    //let mut w: [f32; 4] = [0.5, -0.1, 0.4, -0.27];
    let mut w: [f32; 100] = [0.07791581678500914, 0.2621280424170689, 0.4650985973808761, 0.1901379758090317, 0.20698259044623557, 0.15289829501922025, 0.12797760121797774, -0.49729119791933274, 0.31116176341504354, 0.004735062465595297, -0.32434920997624317, 0.4731954026354246, 0.4714256514025208, -0.39530310273825964, 0.34663781203424326, -0.124660806175515, -0.4940462048816471, -0.19340372815945495, 0.07455043311873233, 0.3739502223209201, 0.4315173329384493, -0.17161781653046404, 0.08031035412843535, 0.3133916893266592, 0.023719840965667593, 0.2167257451812592, 0.18726811625791173, -0.18071638780805632, -0.08780899158335509, 0.2956369068522767, -0.34413002385253755, 0.4223759201958325, 0.4391197921388834, 0.4705419277095305, 0.37168520992666176, -0.24611523501633403, -0.12449764814238717, 0.3072621886095631, -0.0017346025709016333, 0.15226957684365428, 0.2582672673296229, -0.18003306634628014, 0.2330126282185514, -0.332972920960509, -0.20310790467865747, 0.04224300017328597, 0.4986064477736467, 0.45429201931310836, -0.06787219015415136, -0.42232763478623436, -0.28977425044306737, -0.4214996107428831, -0.2728831608500879, -0.043401601940293744, 0.23738168597718667, 0.3763922420819418, 0.4276395197448297, 0.2639229972585476, 0.21831058393137848, -0.16619862702010002, 0.15449916211329617, -0.46754905893767496, 0.10487799259896324, -0.46802275983820696, 0.32851228228976515, -0.11243541965861203, -0.023049832194107833, 0.32107550027702236, -0.15006065788420553, -0.04542316814054648, 0.16809853122735452, 0.42979462608294916, 0.007173466149432595, 0.029307702173229866, 0.16007384513652267, -0.14423359770147082, 0.20967274926887736, 0.1721900390898452, -0.437348738883255, 0.2762568312300612, -0.3150756215697095, -0.4727899031519027, 0.27096746238528124, -0.16318680053208046, -0.35510976558676466, -0.22527803328800067, 0.1730641750858899, -0.20487867761834788, 0.11128916164330804, -0.2924416602690044, 0.4356567813026596, -0.4237612390063765, 0.01037238217497205, -0.49547667134222817, 0.1263107999250922, -0.36588814634072575, 0.46236944073163544, -0.16883497065039488, 0.2097642340981002, 0.05043677662063284];
    let target: [f32; 2] = [-1.0, 1.0];
    let mut b: f32 = 0.3256;
    let alfa: f32 = 0.01;
    let mut yLiq: f32 = 0.0;
    let mut contCiclo: i32 = 0;
    let mut y: f32;
    let yTeste: f32;
    let mut lin: usize;
    let mut col: usize;
    let mut condErro: i32 = 1;
    let mut teste: f32;

    for indice in 0..100 {
        if vetor_matriz_1[indice] == true {
            entradas[0][indice] = 1.0;
        }
    }

    for indice in 0..100 {
        if vetor_matriz_2[indice] == true {
            entradas[1][indice] = 1.0;
        }
    }

    for indice in 0..100 {
        if vetor_teste[indice] == true {
            entrada_teste[indice] = 1.0;
        }
    }

    while (condErro == 1) {
        condErro = 0;
        lin = 0;

        while (lin < 2) {
            yLiq = 0.0;
            col = 0;

            while (col < 100) {
                yLiq = yLiq + (entradas[lin][col] * w[col]);
                col += 1;
            }

            yLiq += b;

            if (yLiq >= limiar) {
                y = 1.0;
            } else {
                y = -1.0;
            }

            println!("{y} - target: {}", target[lin]);

            if (y != target[lin]) {
                condErro = 1;
                col = 0;
                
                while (col < 100) {
                    w[col] = w[col] + (alfa * target[lin] * entradas[lin][col]);
                    col += 1;
                }

                b = b + (alfa * target[lin]);
            }

            lin += 1;
        }

        println!("Ciclo: {contCiclo}");

        contCiclo += 1;
    }

    println!("Rede treinada!");

    col = 0;

    while (col < 100) {
        print!("\n Peso[{col}]: {}", w[col]);
        col += 1;
    }

    println!("Bias: {b}");

    lin = 0;

    while (lin < 2) {
        col = 0;

        while (col < 100) {
            println!("Entrada[{}][{}]: {}", lin, col, entradas[lin][col]);
            col += 1;
        }

        lin += 1;
    }

    //for(lin = 0; lin < 2; lin++){
    for lin in 0..2 {
        teste = 0.0;

        for col in 0..100 {
            teste = teste + (entrada_teste[col] * w[col]);
        }

        teste  = teste + b;

        if teste >= limiar {
            yTeste = 1.0;

            return format!("Letra 1");
        } else {
            yTeste = -1.0;

            return format!("Letra 2");
        }
    }

    format!("desconhecida! (WIP)")
}

/*
#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn treinar_rede(vetor_matriz_1: Vec<bool>, vetor_matriz_2: Vec<bool>, vetor_teste: Vec<bool>) -> String {
    println!("Treinando rede...");

    let mut entradas: [[f32; 100]; 2] = [[-1.0; 100]; 2];
    
    
    let y: [f32; 2] = [1.0, -1.0];

    
    let mut deltaW: [f32; 100] = [0.0; 100];
    let mut deltaB: f32;
    let mut w: [f32; 100] = [0.0; 100];
    let mut b: f32 = 0.0;
    let mut deltaTeste: f32;

    
    let cont1: i32;
    let cont2: i32;
    let mut teste: [f32; 100] = [0.0; 100];


    for indice in 0..100 {
        if vetor_matriz_1[indice] == true {
            entradas[0][indice] = 1.0;
        }
    }

    for indice in 0..100 {
        if vetor_matriz_2[indice] == true {
            entradas[1][indice] = 1.0;
        }
    }

    for indice in 0..100 {
        if vetor_teste[indice] == true {
            teste[indice] = 1.0;
        }
    }

    for cont1 in 0..entradas.len() {
        for cont2 in 0..100 {
            deltaW[cont2] = entradas[cont1][cont2] * y[cont1];
        }

        deltaB = y[cont1];

        for cont2 in 0.. 100 {
            w[cont2] = w[cont2] + entradas[cont1][cont2] * y[cont1];
        }

        b += deltaB;
    }

    //for cont1 in 0..entradas.len() {
    deltaTeste = 0.0;

    for cont2 in 0..100 {
        deltaTeste += w[cont2] * teste[cont2];
    }

    deltaTeste += b;

    if deltaTeste >= 0.0 {
        //teste[cont1] = 1.0;
        return format!("Letra 1");
    } else {
        //teste[cont1] = -1.0;
        return format!("Letra 2");
    }
    //};

    //println!("Saĩda esperada: 1(A) - 1(B)");
    //println!("Saída encontrada: {}{}", teste[0], teste[1]);

    format!("desconhecida!")
}
    */

/*
#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
    */
