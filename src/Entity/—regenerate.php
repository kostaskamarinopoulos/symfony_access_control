<?php

namespace App\Entity;

use App\Repository\—regenerateRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: —regenerateRepository::class)]
class —regenerate
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $UserCategory = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUserCategory(): ?string
    {
        return $this->UserCategory;
    }

    public function setUserCategory(string $UserCategory): self
    {
        $this->UserCategory = $UserCategory;

        return $this;
    }
}
