package Digitalbooking.accommodations.service.impl;

import Digitalbooking.accommodations.dto.CategoriaDTO;
import Digitalbooking.accommodations.entities.Categoria;
import Digitalbooking.accommodations.repository.ICategoriaRepository;
import Digitalbooking.accommodations.service.ICategoriaService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class CategoriaService implements ICategoriaService {

    @Autowired
    private ICategoriaRepository categoriaRepository;

    @Autowired
    private ObjectMapper mapper;

    @Override
    public CategoriaDTO findById(Integer id) {
        Optional<Categoria>categoria = categoriaRepository.findById(id);
        CategoriaDTO categoriaDTO = null;
        if(categoria.isPresent())
            categoriaDTO =mapper.convertValue(categoria, CategoriaDTO.class);
        return categoriaDTO;
    }

    @Override
    public CategoriaDTO create(CategoriaDTO categoriaDTO) {
        Categoria categoria = mapper.convertValue(categoriaDTO, Categoria.class);
        Categoria resCategoria=categoriaRepository.save(categoria);
        CategoriaDTO resCategoriaDTO=mapper.convertValue(resCategoria,CategoriaDTO.class);
        return resCategoriaDTO;
    }

    @Override
    public void deleteById(Integer id) {
        categoriaRepository.deleteById(id);
    }

    @Override
    public CategoriaDTO update(CategoriaDTO categoriaDTO) {
        Categoria categoria = mapper.convertValue(categoriaDTO, Categoria.class);
        Categoria updateCategoria=categoriaRepository.save(categoria);
        CategoriaDTO updateCategoriaDTO=mapper.convertValue(updateCategoria,CategoriaDTO.class);
        return updateCategoriaDTO;
    }

    @Override
    public Set<CategoriaDTO> findAll() {
       List<Categoria> categorias = categoriaRepository.findAll();
       Set<CategoriaDTO> categoriasDTO = new HashSet<>();
       for(Categoria categoria : categorias){
           categoriasDTO.add(mapper.convertValue(categoria, CategoriaDTO.class));

       }
        return categoriasDTO;
    }
}
