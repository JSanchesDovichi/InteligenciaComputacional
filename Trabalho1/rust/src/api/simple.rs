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

/*
#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
    */
