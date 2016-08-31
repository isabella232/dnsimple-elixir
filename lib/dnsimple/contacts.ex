defmodule Dnsimple.Contacts do
  alias Dnsimple.Client
  alias Dnsimple.Response
  alias Dnsimple.Contact

  @moduledoc """
  Represents the operations that can be performed with contacts.

  See: https://developer.dnsimple.com/v2/contacts/
  """


  @doc """
  Lists the contacts in the account.

  See https://developer.dnsimple.com/v2/contacts/#list
  """
  @spec contacts(Client.t, String.t | integer) :: Response.t
  def contacts(client, account_id, options \\ []) do
    url = Client.versioned("/#{account_id}/contacts")

    Client.get_list(client, url, options)
    |> Response.parse(Contact)
  end

  @doc """
  Gets a contact in the account.

  See https://developer.dnsimple.com/v2/contacts/#get
  """
  @spec contact(Client.t, String.t | integer, String.t | integer, Keyword.t) :: Response.t
  def contact(client, account_id, contact_id, options \\ []) do
    url = Client.versioned("/#{account_id}/contacts/#{contact_id}")

    Client.get(client, url, options)
    |> Response.parse(Contact)
  end

  @doc """
  Creates a contact in the account.

  See https://developer.dnsimple.com/v2/contacts/#create
  """
  @spec create_contact(Client.t, String.t | integer, Keyword.t, Keyword.t) :: Response.t
  def create_contact(client, account_id, attributes, options \\ []) do
    url = Client.versioned("/#{account_id}/contacts")

    Client.post(client, url, attributes, options)
    |> Response.parse(Contact)
  end


  @doc """
  Updates a contact in the account.

  See https://developer.dnsimple.com/v2/contacts/#update
  """
  @spec update_contact(Client.t, String.t | integer, String.t | integer, Keyword.t, Keyword.t) :: Response.t
  def update_contact(client, account_id, contact_id, attributes, options \\ []) do
    url = Client.versioned("/#{account_id}/contacts/#{contact_id}")

    Client.patch(client, url, attributes, options)
    |> Response.parse(Contact)
  end

  @doc """
  Deletes a contact in the account.

  See https://developer.dnsimple.com/v2/contacts/#delete
  """
  @spec delete_contact(Client.t, String.t | integer, String.t | integer, Keyword.t) :: Response.t
  def delete_contact(client, account_id, contact_id, options \\ []) do
    url = Client.versioned("/#{account_id}/contacts/#{contact_id}")

    Client.delete(client, url, options)
    |> Response.parse(nil)
  end

end
