class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def show

  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to suppliers_path
    else
      render :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
      if @supplier.update(supplier_params)
        redirect_to suppliers_path
      else
        render :edit
      end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    redirect_to suppliers_path
  end


  private

  def supplier_params
    params.require(:supplier).permit(:code_suppliers, :id_person, :nit_company, :name, :last_name, :kind, :sex, :email, :telephone, :address)
  end

end
