package Digitalbooking.accommodations.service.impl;

import Digitalbooking.accommodations.dto.ImagenDTO;
import Digitalbooking.accommodations.entities.Imagen;
import Digitalbooking.accommodations.repository.IImagenRepository;
import Digitalbooking.accommodations.service.IImagenService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class ImagenService implements IImagenService {
    @Autowired
    private IImagenRepository imagenRepository;

    @Autowired
    private ObjectMapper mapper;

    @Override
    public ImagenDTO findById(Integer id) {
        Optional<Imagen> imagen = imagenRepository.findById(id);
        ImagenDTO imagenDTO=null;
        if(imagen.isPresent())
            imagenDTO=mapper.convertValue(imagen,ImagenDTO.class);
        return imagenDTO;
    }

    @Override
    public ImagenDTO create(ImagenDTO imagenDTO) {
        Imagen imagen = mapper.convertValue(imagenDTO, Imagen.class);
        Imagen resImagen=imagenRepository.save(imagen);
        ImagenDTO resImagenDTO=mapper.convertValue(resImagen,ImagenDTO.class);
        return resImagenDTO;
    }

    @Override
    public void deleteById(Integer id) {
        imagenRepository.deleteById(id);
    }

    @Override
    public ImagenDTO update(ImagenDTO imagenDTO) {
        Imagen imagen = mapper.convertValue(imagenDTO,Imagen.class);
        Imagen updateImagen=imagenRepository.save(imagen);
        ImagenDTO updateImagenDTO=mapper.convertValue(updateImagen,ImagenDTO.class);
        return updateImagenDTO;
    }

    @Override
    public Set<ImagenDTO> findAll() {
        List<Imagen> imagenes = imagenRepository.findAll();
        Set<ImagenDTO>imagenDTOS=new HashSet<>();
        for (Imagen imagen : imagenes){
            imagenDTOS.add(mapper.convertValue(imagen,ImagenDTO.class));
        }
        return imagenDTOS;
    }
}
