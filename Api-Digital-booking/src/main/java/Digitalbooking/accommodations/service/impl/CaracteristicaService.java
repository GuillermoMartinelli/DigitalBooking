package Digitalbooking.accommodations.service.impl;

import Digitalbooking.accommodations.dto.CaracteristicaDTO;
import Digitalbooking.accommodations.entities.Caracteristica;
import Digitalbooking.accommodations.repository.ICaracteristicaRepository;
import Digitalbooking.accommodations.service.ICaracteristicaService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class CaracteristicaService implements ICaracteristicaService {

    @Autowired
    private ICaracteristicaRepository caracteristicaRepository;

    @Autowired
    private ObjectMapper mapper;

    @Override
    public CaracteristicaDTO findById(Integer id) {
        Optional<Caracteristica> caracteristica = caracteristicaRepository.findById(id);
        CaracteristicaDTO caracteristicaDTO = null;
        if(caracteristica.isPresent())
            caracteristicaDTO =mapper.convertValue(caracteristica, CaracteristicaDTO.class);
        return caracteristicaDTO;
    }

    @Override
    public CaracteristicaDTO create(CaracteristicaDTO caracteristicaDTO) {
        Caracteristica caracteristica = mapper.convertValue(caracteristicaDTO, Caracteristica.class);
        Caracteristica resCaracteristica=caracteristicaRepository.save(caracteristica);
        CaracteristicaDTO resCaracteristicaDTO=mapper.convertValue(resCaracteristica,CaracteristicaDTO.class);
        return resCaracteristicaDTO;
    }

    @Override
    public void deleteById(Integer id) {
        caracteristicaRepository.deleteById(id);
    }

    @Override
    public CaracteristicaDTO update(CaracteristicaDTO caracteristicaDTO) {
        Caracteristica caracteristica = mapper.convertValue(caracteristicaDTO, Caracteristica.class);
        Caracteristica updateCaracteristica=caracteristicaRepository.save(caracteristica);
        CaracteristicaDTO updateCaracteristicaDTO=mapper.convertValue(updateCaracteristica,CaracteristicaDTO.class);
        return updateCaracteristicaDTO;
    }

    @Override
    public Set<CaracteristicaDTO> findAll() {
        List<Caracteristica> caracteristicas = caracteristicaRepository.findAll();
        Set<CaracteristicaDTO> caracteristicasDTO = new HashSet<>();
        for(Caracteristica caracteristica : caracteristicas){
            caracteristicasDTO.add(mapper.convertValue(caracteristica, CaracteristicaDTO.class));

        }
        return caracteristicasDTO;
    }
}
