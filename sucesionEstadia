package sucesionestadia;
import java.util.Scanner;

public class SucesionEstadia {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in); //Objeto para solicitar datos al usuario
        
        int n, n1 = 0, n2 = 1, n3; //n1 y n2 son números que se sumarán y guardarán en n3. Iniciarán como 0 y 1.
        
        System.out.println("¿Cuántos elementos de la sucesión [1, 2, 3, 5, 8... n] desea listar?");
        n = input.nextInt();
        
        for(int i = 0; i < n; i++){
            n3 = n1 + n2; //El primer término de nuestra sucesión (n3) está formado por la suma de n1 y n2 (0 y 1)            
            n1 = n2; //Cada ciclo se actualizarán los valores, recorriéndose para sumar los dos valores anteriores
            n2 = n3; //n2 toma el valor del último número que mostramos en la sucesión y está listo para sumarse en el sig ciclo
            System.out.print(n3+", ");
        }
    }
}
