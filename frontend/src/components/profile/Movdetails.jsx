import React, { Component } from "react";
import "../../styles/profile/movements.css";
export default class Mov__details extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }
  render() {
    return (
      <div className="movements__details" key={this.props.id}>
        <div className="movements__details_id">{this.props.id}</div>
        <div className="movements__details_name">{this.props.propiedad}</div>
        <div className="movements__location">
          <div className="movements__location">{this.props.ubicacion},</div>
          <div className="movements__country">{this.props.pais}</div>
        </div>
        <div className="movements__check">{this.props.checkIn}</div>
        <div className="movements__check">{this.props.checkOut}</div>
        <div className="movements__hour">{this.props.hora}</div>
      </div>
    );
  }
}
