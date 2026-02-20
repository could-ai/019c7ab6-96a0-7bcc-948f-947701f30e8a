import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceItem {
  final String title;
  final String description;
  final IconData icon;

  const ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class SiteData {
  static const String companyName = "KG Business Management";
  static const String tagline = "Your Partner in Business Success";
  static const String heroDescription = "We provide comprehensive accounting, CFO, and corporate services to help your business grow and thrive in a competitive landscape.";
  
  static const List<ServiceItem> services = [
    ServiceItem(
      title: "CFO Services",
      description: "Expert financial leadership including Virtual, Full-Time, Special Purpose, and Interim CFO solutions tailored to your needs.",
      icon: FontAwesomeIcons.chartLine,
    ),
    ServiceItem(
      title: "Corporate Services",
      description: "Strategic corporate governance, compliance management, and business structuring to ensure long-term stability.",
      icon: FontAwesomeIcons.building,
    ),
    ServiceItem(
      title: "Business Solutions",
      description: "Holistic solutions covering accounting, taxation, operational support, turnaround management, and consultancy.",
      icon: FontAwesomeIcons.lightbulb,
    ),
    ServiceItem(
      title: "Payroll Services",
      description: "Accurate and timely payroll processing, ensuring compliance with all legislative requirements.",
      icon: FontAwesomeIcons.moneyBillWave,
    ),
    ServiceItem(
      title: "R&D Tax Incentives",
      description: "Specialized assistance with Research and Development tax incentives to fuel your innovation.",
      icon: FontAwesomeIcons.flask,
    ),
    ServiceItem(
      title: "Recruitment",
      description: "Finding the right talent for your financial and operational teams to drive business success.",
      icon: FontAwesomeIcons.userTie,
    ),
  ];

  static const List<String> industries = [
    "Small & Medium Business",
    "ICT & Technology",
    "Transport & Logistics",
    "Medical & Healthcare",
    "Construction & Engineering",
  ];

  static const String contactEmail = "info@kgbm.com.au";
  static const String contactPhone = "+61 2 1234 5678"; // Placeholder based on typical format
  static const String address = "Sydney, Australia"; // Placeholder
}
