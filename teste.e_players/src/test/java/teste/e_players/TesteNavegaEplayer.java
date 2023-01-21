package teste.e_players;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.time.Duration;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TesteNavegaEplayer {
	ChromeDriver driver;

	@Before
	public void PreTeste() {
		System.setProperty("webdriver.chrome.driver",
				"C:\\Users\\pedro\\Documents\\chromedriver_win32\\chromedriver.exe");
		this.driver = new ChromeDriver();
		// this.driver.manage().window().maximize();
		this.driver.get("http://localhost:4200/");
		this.driver.findElement(By.xpath("//*[@id=\"navMenu\"]/a[5]")).click();
		;
	}

	@Test
	public void TesteNavegacao() {
		WebElement inputEmail = this.driver.findElement(By.id("email"));
		WebElement inputSenha = this.driver.findElement(By.id("senha"));
		WebElement inputSubmit = this.driver.findElement(By.xpath("//*[@id=\"signin\"]"));
		String[] listaEmails = { "jose@email.com", "joao@email.com", "email sem formato", "eduardo@email.com" };

		String[] listaSenhas = { "senhaum", "outrasenha", "senhaerrada", "12345678" };
		for (int tentativas = 0; tentativas < listaSenhas.length; tentativas++) {

			try {
				inputEmail.clear();
				inputSenha.clear();

				inputEmail.sendKeys(listaEmails[tentativas]);
				inputSenha.sendKeys(listaSenhas[tentativas]);
				inputSubmit.click();

				Thread.sleep(3000);
			} catch (InterruptedException error) {
				error.printStackTrace();

			}

		}

	}

	@After
	public void FinalizarTeste() {
		try {
			Thread.sleep(3000);
			driver.quit();
		} catch (Exception error) {
			error.printStackTrace();
		}
		

	}
}
