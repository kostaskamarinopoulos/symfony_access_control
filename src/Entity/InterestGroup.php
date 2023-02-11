<?php

namespace App\Entity;

use App\Repository\InterestGroupRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: InterestGroupRepository::class)]
class InterestGroup
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?string $name = null;

    #[ORM\OneToMany(targetEntity: Participation::class, mappedBy: "interestGroup")]
    private $userParticipations;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

        /**
     * Get typeSponsor
     *
     * @return \Doctrine\Common\Collection\ArrayCollection
     */
    public function getUserParticipations() {
        return $this->userParticipations;
   }
}
