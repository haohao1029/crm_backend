defmodule CrmBackend.SettingsTest do
  use CrmBackend.DataCase

  alias CrmBackend.Settings

  describe "users" do
    alias CrmBackend.Settings.User

    @valid_attrs %{name: "some name", role: "some role"}
    @update_attrs %{name: "some updated name", role: "some updated role"}
    @invalid_attrs %{name: nil, role: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Settings.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Settings.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Settings.create_user(@valid_attrs)
      assert user.name == "some name"
      assert user.role == "some role"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Settings.update_user(user, @update_attrs)
      assert user.name == "some updated name"
      assert user.role == "some updated role"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_user(user, @invalid_attrs)
      assert user == Settings.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Settings.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Settings.change_user(user)
    end
  end

  describe "contacts" do
    alias CrmBackend.Settings.Contact

    @valid_attrs %{email: "some email", name: "some name", phone_no: "some phone_no"}
    @update_attrs %{email: "some updated email", name: "some updated name", phone_no: "some updated phone_no"}
    @invalid_attrs %{email: nil, name: nil, phone_no: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_contact()

      contact
    end

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Settings.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Settings.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Settings.create_contact(@valid_attrs)
      assert contact.email == "some email"
      assert contact.name == "some name"
      assert contact.phone_no == "some phone_no"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{} = contact} = Settings.update_contact(contact, @update_attrs)
      assert contact.email == "some updated email"
      assert contact.name == "some updated name"
      assert contact.phone_no == "some updated phone_no"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_contact(contact, @invalid_attrs)
      assert contact == Settings.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Settings.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Settings.change_contact(contact)
    end
  end

  describe "companies" do
    alias CrmBackend.Settings.Company

    @valid_attrs %{email: "some email", name: "some name", owner: "some owner", phone_no: "some phone_no"}
    @update_attrs %{email: "some updated email", name: "some updated name", owner: "some updated owner", phone_no: "some updated phone_no"}
    @invalid_attrs %{email: nil, name: nil, owner: nil, phone_no: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Settings.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Settings.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Settings.create_company(@valid_attrs)
      assert company.email == "some email"
      assert company.name == "some name"
      assert company.owner == "some owner"
      assert company.phone_no == "some phone_no"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, %Company{} = company} = Settings.update_company(company, @update_attrs)
      assert company.email == "some updated email"
      assert company.name == "some updated name"
      assert company.owner == "some updated owner"
      assert company.phone_no == "some updated phone_no"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_company(company, @invalid_attrs)
      assert company == Settings.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Settings.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Settings.change_company(company)
    end
  end

  describe "roles" do
    alias CrmBackend.Settings.Role

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def role_fixture(attrs \\ %{}) do
      {:ok, role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_role()

      role
    end

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Settings.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Settings.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      assert {:ok, %Role{} = role} = Settings.create_role(@valid_attrs)
      assert role.name == "some name"
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      assert {:ok, %Role{} = role} = Settings.update_role(role, @update_attrs)
      assert role.name == "some updated name"
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_role(role, @invalid_attrs)
      assert role == Settings.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Settings.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Settings.change_role(role)
    end
  end

  describe "assets" do
    alias CrmBackend.Settings.Asset

    @valid_attrs %{name: "some name", price: 120.5}
    @update_attrs %{name: "some updated name", price: 456.7}
    @invalid_attrs %{name: nil, price: nil}

    def asset_fixture(attrs \\ %{}) do
      {:ok, asset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_asset()

      asset
    end

    test "list_assets/0 returns all assets" do
      asset = asset_fixture()
      assert Settings.list_assets() == [asset]
    end

    test "get_asset!/1 returns the asset with given id" do
      asset = asset_fixture()
      assert Settings.get_asset!(asset.id) == asset
    end

    test "create_asset/1 with valid data creates a asset" do
      assert {:ok, %Asset{} = asset} = Settings.create_asset(@valid_attrs)
      assert asset.name == "some name"
      assert asset.price == 120.5
    end

    test "create_asset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_asset(@invalid_attrs)
    end

    test "update_asset/2 with valid data updates the asset" do
      asset = asset_fixture()
      assert {:ok, %Asset{} = asset} = Settings.update_asset(asset, @update_attrs)
      assert asset.name == "some updated name"
      assert asset.price == 456.7
    end

    test "update_asset/2 with invalid data returns error changeset" do
      asset = asset_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_asset(asset, @invalid_attrs)
      assert asset == Settings.get_asset!(asset.id)
    end

    test "delete_asset/1 deletes the asset" do
      asset = asset_fixture()
      assert {:ok, %Asset{}} = Settings.delete_asset(asset)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_asset!(asset.id) end
    end

    test "change_asset/1 returns a asset changeset" do
      asset = asset_fixture()
      assert %Ecto.Changeset{} = Settings.change_asset(asset)
    end
  end

  describe "sidebars" do
    alias CrmBackend.Settings.Sidebar

    @valid_attrs %{collapse: "some collapse", icontype: "some icontype", parent_sidebar: 42, path: "some path", title: "some title"}
    @update_attrs %{collapse: "some updated collapse", icontype: "some updated icontype", parent_sidebar: 43, path: "some updated path", title: "some updated title"}
    @invalid_attrs %{collapse: nil, icontype: nil, parent_sidebar: nil, path: nil, title: nil}

    def sidebar_fixture(attrs \\ %{}) do
      {:ok, sidebar} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_sidebar()

      sidebar
    end

    test "list_sidebars/0 returns all sidebars" do
      sidebar = sidebar_fixture()
      assert Settings.list_sidebars() == [sidebar]
    end

    test "get_sidebar!/1 returns the sidebar with given id" do
      sidebar = sidebar_fixture()
      assert Settings.get_sidebar!(sidebar.id) == sidebar
    end

    test "create_sidebar/1 with valid data creates a sidebar" do
      assert {:ok, %Sidebar{} = sidebar} = Settings.create_sidebar(@valid_attrs)
      assert sidebar.collapse == "some collapse"
      assert sidebar.icontype == "some icontype"
      assert sidebar.parent_sidebar == 42
      assert sidebar.path == "some path"
      assert sidebar.title == "some title"
    end

    test "create_sidebar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_sidebar(@invalid_attrs)
    end

    test "update_sidebar/2 with valid data updates the sidebar" do
      sidebar = sidebar_fixture()
      assert {:ok, %Sidebar{} = sidebar} = Settings.update_sidebar(sidebar, @update_attrs)
      assert sidebar.collapse == "some updated collapse"
      assert sidebar.icontype == "some updated icontype"
      assert sidebar.parent_sidebar == 43
      assert sidebar.path == "some updated path"
      assert sidebar.title == "some updated title"
    end

    test "update_sidebar/2 with invalid data returns error changeset" do
      sidebar = sidebar_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_sidebar(sidebar, @invalid_attrs)
      assert sidebar == Settings.get_sidebar!(sidebar.id)
    end

    test "delete_sidebar/1 deletes the sidebar" do
      sidebar = sidebar_fixture()
      assert {:ok, %Sidebar{}} = Settings.delete_sidebar(sidebar)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_sidebar!(sidebar.id) end
    end

    test "change_sidebar/1 returns a sidebar changeset" do
      sidebar = sidebar_fixture()
      assert %Ecto.Changeset{} = Settings.change_sidebar(sidebar)
    end
  end
end
