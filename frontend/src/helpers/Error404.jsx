import React from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/header/Header';
import Footer from '../components/Footer';
import monkeyNotFound from '../assets/images/monkey-error-404.png';
import '../styles/errorMono.css';

const Error404 = () => {
  return (
    <>
      <Header />
      <div className='mono__buscar'>
        <h2>Página no encontrada</h2>
        <img src={monkeyNotFound} alt='Mono buscando la página' />
        <Link to='/'>Ir al Home</Link>
      </div>
      <Footer />
    </>
  );
};

export default Error404;
