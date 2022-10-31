import React from 'react';
import '../../styles/products/productsDescription.css';

function ProductsDescription(props) {
  const product = props.productDetails;
  return (
    <div className='productsDescription'>
      <h3>Alojate en el corazon de {product.ciudad.city}</h3>
      <p>{product.description}</p>
    </div>
  );
}

export default ProductsDescription;
