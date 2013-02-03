package homebuh.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "accounts")
public class Account implements Serializable {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	@Column(name = "name", length = 255)
	private String name;
	@Column(name = "description", length = 255)
	private String description;
	@Column(name = "balance")
	private float balance;
	@ManyToOne
	@JoinColumn(name = "status")
	private AccStatus status;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "accountTo")
	private Set<Payment> inPayments;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "accountFrom")
	private Set<Payment> outPayments;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}

	public AccStatus getStatus() {
		return status;
	}

	public void setStatus(AccStatus status) {
		this.status = status;
	}

	public Set<Payment> getInPayments() {
		return inPayments;
	}

	public void setInPayments(Set<Payment> inPayments) {
		this.inPayments = inPayments;
	}

	public Set<Payment> getOutPayments() {
		return outPayments;
	}

	public void setOutPayments(Set<Payment> outPayments) {
		this.outPayments = outPayments;
	}

}
