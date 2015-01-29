package br.com.convergencia.emendas.model.users;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "system_authority")
public class Authority {

	@Id
	private String name;

	public String getName() {
		return name;
	}

}

